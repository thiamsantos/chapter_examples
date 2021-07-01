# ChapterExamples

1. Application configuration

Bad:

https://github.com/agevio/mixpanel_api_ex
https://github.com/zhyu/nadia

Good:

https://github.com/edgurgel/pusher
https://github.com/thiamsantos/mxpanel/blob/main/test/mxpanel_test.exs#L16

2. Custom HTTP Client

Examples:

https://github.com/agevio/mixpanel_api_ex/blob/master/lib/mixpanel/client.ex#L48
https://github.com/aws-beam/aws-elixir/blob/v0.7.0/lib/aws/client.ex#L44

3. uso de genserver

attention points :

- Single process bottlenecek

### "cache"

- agent
  -- simple
  -- memory inside process
  -- GC
- ets + genserver
  -- memory in ets
  -- no GC in cache
  -- read/writes through process
- ets + protected named table
  -- memory in ets
  -- no GC in cache
  -- reads direct to ets without process communication

## References

- https://dashbit.co/blog/goth-redesign
- https://cevado.me/posts/otp-applications/
- https://hexdocs.pm/elixir/library-guidelines.html#avoid-application-configuration
