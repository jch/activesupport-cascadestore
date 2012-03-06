# ActiveSupport::Cache::CascadeStore

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
