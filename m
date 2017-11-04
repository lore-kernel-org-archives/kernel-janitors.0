From: Eric Dumazet <edumazet@google.com>
Date: Sat, 04 Nov 2017 15:15:31 +0000
Subject: Re: [bug report] ipv6: addrconf: add per netns perturbation in inet6_addr_hash()
Message-Id: <CANn89iJR0GREnPXyPJnbZTAbO6RjVYbeGu9Wn76YS4XOGRpeSg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171104083119.kpl47mryrx3h27pl@mwanda> <CANn89iLvHEDcbNjWtX3R+h+Mnq97dk4do1Yr0E59JJR1-jmM0A@mail.gmail.com>
 <CANn89iK=vTgVH-J2b5Gfb7Jbq1NVqZ-dp0vo8iG+_iKxO-H-+A@mail.gmail.com>
In-Reply-To: <CANn89iK=vTgVH-J2b5Gfb7Jbq1NVqZ-dp0vo8iG+_iKxO-H-+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, netdev <netdev@vger.kernel.org>
Cc: kernel-janitors@vger.kernel.org

On Sat, Nov 4, 2017 at 7:24 AM, Eric Dumazet <edumazet@google.com> wrote:
> On Sat, Nov 4, 2017 at 7:13 AM, Eric Dumazet <edumazet@google.com> wrote:
>> On Sat, Nov 4, 2017 at 1:31 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>>> Hello Eric Dumazet,
>>>
>>> The patch 3f27fb23219e: "ipv6: addrconf: add per netns perturbation
>>> in inet6_addr_hash()" from Oct 23, 2017, leads to the following
>>> static checker warning:
>>>
>>>         net/core/pktgen.c:2169 pktgen_setup_inject()
>>>         error: buffer overflow 'pkt_dev->cur_in6_saddr.in6_u.u6_addr8' 16 <= 255
>>>
>>> net/core/pktgen.c
>>>   2157          if (pkt_dev->flags & F_IPV6) {
>>>   2158                  int i, set = 0, err = 1;
>>>   2159                  struct inet6_dev *idev;
>>>   2160
>>>   2161                  if (pkt_dev->min_pkt_size = 0) {
>>>   2162                          pkt_dev->min_pkt_size = 14 + sizeof(struct ipv6hdr)
>>>   2163                                                  + sizeof(struct udphdr)
>>>   2164                                                  + sizeof(struct pktgen_hdr)
>>>   2165                                                  + pkt_dev->pkt_overhead;
>>>   2166                  }
>>>   2167
>>>   2168                  for (i = 0; i < IN6_ADDR_HSIZE; i++)
>>>                                         ^^^^^^^^^^^^^^
>>> My guess is that this is the wrong test here, but I don't know for sure.
>>>
>>>   2169                          if (pkt_dev->cur_in6_saddr.s6_addr[i]) {
>>>                                                            ^^^^^^^^^^
>>> This used to work but now that IN6_ADDR_HSIZE is 256 instead of 16 we're
>>> reading beyond the end of the array.
>>>
>>>   2170                                  set = 1;
>>>   2171                                  break;
>>>   2172                          }
>>>   2173
>>>   2174                  if (!set) {
>>>   2175
>>>   2176                          /*
>>>   2177                           * Use linklevel address if unconfigured.
>>>   2178                           *
>>>   2179                           * use ipv6_get_lladdr if/when it's get exported
>>>   2180                           */
>>>   2181
>>>
>>> regards,
>>> dan carpenter
>>
>> pktgen is obviously wrong.
>>
>> Thanks for the report.
>
> I am travelling to Seoul for netconf/netdev, please send this patch in
> an official way.
>
> Thanks !
>
> diff --git a/net/core/pktgen.c b/net/core/pktgen.c
> index 6e1e10ff433a5f4097d1d4b33848ab13d4e005c6..e3fa53a07d34b3e5f6b438e08b440f520b3cd6d4
> 100644
> --- a/net/core/pktgen.c
> +++ b/net/core/pktgen.c
> @@ -2165,7 +2165,7 @@ static void pktgen_setup_inject(struct
> pktgen_dev *pkt_dev)
>                                                 + pkt_dev->pkt_overhead;
>                 }
>
> -               for (i = 0; i < IN6_ADDR_HSIZE; i++)
> +               for (i = 0; i < sizeof(struct in6_addr); i++)
>                         if (pkt_dev->cur_in6_saddr.s6_addr[i]) {
>                                 set = 1;
>                                 break;

Also I would move

include/net/addrconf.h:62:#define IN6_ADDR_HSIZE_SHIFT  8
include/net/addrconf.h:63:#define IN6_ADDR_HSIZE                (1 <<
IN6_ADDR_HSIZE_SHIFT)

to net/ipv6/addrconf.c  to avoid future misuses like that.
