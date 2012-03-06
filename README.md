# ActiveSupport::Cache::CascadeStore

Hopefully this cache store is merged upstream into core
with [this pull request](https://github.com/rails/rails/pull/5263).
In the meantime, packaging this up as a gem for easy access.

A thread-safe cache store implementation that cascades
operations to a list of other cache stores. It is used to
provide fallback cache stores when primary stores become
unavailable, or to put lower latency stores in front of
other cache stores.

For example, to initialize a CascadeStore that
cascades through MemCacheStore, MemoryStore, and FileStore:

    ActiveSupport::Cache.lookup_store(:cascade_store,
      :stores => [
        :mem_cache_store,
        :memory_store,
        :file_store
      ]
    })

Cache operation behavior:

Read: returns first cache hit from :stores, nil if none found

Write/Delete: write/delete through to each cache store in
:stores

Increment/Decrement: increment/decrement each store, returning
the new number if any stores was successfully
incremented/decremented, nil otherwise

### Development

To run tests

```
ruby -Itest test/caching_test.rb
```

### License

Same license as [Rails](http://github.com/rails/rails)