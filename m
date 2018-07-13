From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Jul 2018 15:15:41 +0000
Subject: Re: [PATCH 1/2] samples: bpf: ensure that we don't load over MAX_PROGS programs
Message-Id: <20180713151541.m6ksulnjb6qsh24w@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180713151139.aiqginrahbimfsop@kili.mountain>
 <a3397e41-7e57-d4c2-96e0-427d9386444a@canonical.com>
In-Reply-To: <a3397e41-7e57-d4c2-96e0-427d9386444a@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jul 13, 2018 at 04:13:30PM +0100, Colin Ian King wrote:
> On 13/07/18 16:11, Dan Carpenter wrote:
> > I can't see that we check prog_cnt to ensure it doesn't go over
> > MAX_PROGS.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/samples/bpf/bpf_load.c b/samples/bpf/bpf_load.c
> > index 89161c9ed466..904e775d1a44 100644
> > --- a/samples/bpf/bpf_load.c
> > +++ b/samples/bpf/bpf_load.c
> > @@ -107,6 +107,9 @@ static int load_and_attach(const char *event, struct bpf_insn *prog, int size)
> >  		return -1;
> >  	}
> >  
> > +	if (prog_cnt = MAX_PROGS)
> > +		return -1;
> > +
> 
> Should that be "if (prog_cnt >= MAX_PROGS)" ?

It's incremented one at a time so it can't go over.

regards,
dan carpenter

