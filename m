From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 30 Nov 2018 22:58:03 +0000
Subject: Re: [PATCH net] bpf: uninitialized variables in test code
Message-Id: <20181130225801.7adzjdjkn5cirq4s@ast-mbp.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181129102703.2huzlalirskjdl4k@kili.mountain>
In-Reply-To: <20181129102703.2huzlalirskjdl4k@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, guro@fb.com

On Thu, Nov 29, 2018 at 01:27:03PM +0300, Dan Carpenter wrote:
> Smatch complains that if bpf_test_run() fails with -ENOMEM at the
> begining then the "duration" is uninitialized.  We then copy the
> unintialized variables to the user inside the bpf_test_finish()
> function.  The functions require CAP_SYS_ADMIN so it's not really an
> information leak.
> 
> Fixes: 1cf1cae963c2 ("bpf: introduce BPF_PROG_TEST_RUN command")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

That is incorrect fixes tag.
It should be pointing to commit f42ee093be29 ("bpf/test_run: support cgroup local storage")

bpf_test_run() can only return the value that bpf program returned.
It cannot return -ENOMEM.
That code needs to be refactored.
I think the proper way for bpf_test_run() would be to return 0 or -ENOMEM
and store bpf's retval into extra pointer.
Proper checks need to be added in the callers (bpf_prog_test_run_skb, etc).

Dan, can you do such refactoring or you want to punt back to Roman ?
