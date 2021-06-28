# ChapterExamples

1. Application configuration

https://hexdocs.pm/elixir/library-guidelines.html#avoid-application-configuration

https://github.com/agevio/mixpanel_api_ex
https://github.com/zhyu/nadia

https://github.com/edgurgel/pusher

https://github.com/thiamsantos/mxpanel/blob/main/test/mxpanel_test.exs#L16

2. Custom HTTP Client

https://github.com/agevio/mixpanel_api_ex/blob/master/lib/mixpanel/client.ex#L48

https://github.com/aws-beam/aws-elixir/blob/v0.7.0/lib/aws/client.ex#L44

3. uso de genserver

cuidados:

- funcionalidade dentro de processo
- bottleneck inserido

### "cache"

- agent
  -- simple
  -- memoria dentro do processo
  -- GC
- ets com genserver em volta
  -- memória externa ao processo
  -- sem GC
  -- read/writes passam pelo processo
- ets + protected named table
  -- memória externa ao processo
  -- sem GC
  -- leituras locais sem process-communication
