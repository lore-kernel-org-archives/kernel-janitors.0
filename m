From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 24 Jan 2017 08:46:45 +0000
Subject: Re: [patch] samples/bpf: silence shift wrapping warning
Message-Id: <20170124084645.GA4201@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAADnVQLF6PWEjic6aSRBnRqtO25eEw7YLE+Gb95+f5_pvq3ZMA@mail.gmail.com>
In-Reply-To: <CAADnVQLF6PWEjic6aSRBnRqtO25eEw7YLE+Gb95+f5_pvq3ZMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Thomas Graf <tgraf@suug.ch>, Alexei Starovoitov <ast@kernel.org>, Joe Stringer <joe@ovn.org>, "David S. Miller" <davem@davemloft.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

On Mon, Jan 23, 2017 at 10:44:34PM -0800, Alexei Starovoitov wrote:
> On Mon, Jan 23, 2017 at 5:27 AM, Arnaldo Carvalho de Melo
> <arnaldo.melo@gmail.com> wrote:
> > Em Sun, Jan 22, 2017 at 02:51:25PM -0800, Alexei Starovoitov escreveu:
> >> On Sat, Jan 21, 2017 at 07:51:43AM +0300, Dan Carpenter wrote:
> >> > max_key is a value in the 0-63 range, so on 32 bit systems the shift
> >> > could wrap.
> >> >
> >> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >>
> >> Looks fine. I think 'net-next' is ok.
> >
> > I could process these patches, if that would help,
> 
> Thanks for the offer.
> I don't think there will be conflicts with all the work happening in net-next,
> but it's best to avoid even possibility of it when we can.
> Dan,
> can you please resend the patch cc-ing Dave and netdev ?
> please mention [PATCH net-next] in the subject.
> 

Sure.

regards,
dan carpenter

