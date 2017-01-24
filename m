From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 24 Jan 2017 06:44:34 +0000
Subject: Re: [patch] samples/bpf: silence shift wrapping warning
Message-Id: <CAADnVQLF6PWEjic6aSRBnRqtO25eEw7YLE+Gb95+f5_pvq3ZMA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170121045143.GC15269@mwanda>
In-Reply-To: <20170121045143.GC15269@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Thomas Graf <tgraf@suug.ch>, Alexei Starovoitov <ast@kernel.org>, Joe Stringer <joe@ovn.org>, "David S. Miller" <davem@davemloft.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

On Mon, Jan 23, 2017 at 5:27 AM, Arnaldo Carvalho de Melo
<arnaldo.melo@gmail.com> wrote:
> Em Sun, Jan 22, 2017 at 02:51:25PM -0800, Alexei Starovoitov escreveu:
>> On Sat, Jan 21, 2017 at 07:51:43AM +0300, Dan Carpenter wrote:
>> > max_key is a value in the 0-63 range, so on 32 bit systems the shift
>> > could wrap.
>> >
>> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> Looks fine. I think 'net-next' is ok.
>
> I could process these patches, if that would help,

Thanks for the offer.
I don't think there will be conflicts with all the work happening in net-next,
but it's best to avoid even possibility of it when we can.
Dan,
can you please resend the patch cc-ing Dave and netdev ?
please mention [PATCH net-next] in the subject.

> - Arnaldo
>
>> Acked-by: Alexei Starovoitov <ast@kernel.org>
>
>> > diff --git a/samples/bpf/lwt_len_hist_user.c b/samples/bpf/lwt_len_hist_user.c
>> > index ec8f3bb..bd06eef 100644
>> > --- a/samples/bpf/lwt_len_hist_user.c
>> > +++ b/samples/bpf/lwt_len_hist_user.c
>> > @@ -68,7 +68,7 @@ int main(int argc, char **argv)
>> >     for (i = 1; i <= max_key + 1; i++) {
>> >             stars(starstr, data[i - 1], max_value, MAX_STARS);
>> >             printf("%8ld -> %-8ld : %-8ld |%-*s|\n",
>> > -                  (1l << i) >> 1, (1l << i) - 1, data[i - 1],
>> > +                  (1ULL << i) >> 1, (1ULL << i) - 1, data[i - 1],
>> >                    MAX_STARS, starstr);
>> >     }
>> >
