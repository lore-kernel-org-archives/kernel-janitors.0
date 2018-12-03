From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Dec 2018 10:34:06 +0000
Subject: Re: [PATCH net] bpf: uninitialized variables in test code
Message-Id: <20181203103406.GF3095@unbuntlaptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181129102703.2huzlalirskjdl4k@kili.mountain>
 <20181130225801.7adzjdjkn5cirq4s@ast-mbp.dhcp.thefacebook.com>
In-Reply-To: <20181130225801.7adzjdjkn5cirq4s@ast-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Roman Gushchin <guro@fb.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

I'm afraid Roman's patch doesn't fix the bug.

On Fri, Nov 30, 2018 at 02:58:03PM -0800, Alexei Starovoitov wrote:
> On Thu, Nov 29, 2018 at 01:27:03PM +0300, Dan Carpenter wrote:
> > Smatch complains that if bpf_test_run() fails with -ENOMEM at the
> > begining then the "duration" is uninitialized.  We then copy the
> > unintialized variables to the user inside the bpf_test_finish()
> > function.  The functions require CAP_SYS_ADMIN so it's not really an
> > information leak.
> > 
> > Fixes: 1cf1cae963c2 ("bpf: introduce BPF_PROG_TEST_RUN command")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> That is incorrect fixes tag.

Yeah.  You're right.  The Fixes tag is wrong.  I spent some time looking
at this too, because the code is old but the warning only just
appeared...  :/

Thanks for fixing this, Roman.

regards,
dan carpenter
