From: Domen Puncer <domen@coderock.org>
Date: Fri, 01 Jul 2005 22:22:51 +0000
Subject: [KJ] Re: GCC4 warning: no return statement in function returning
Message-Id: <20050701222251.GB26388@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48628916656229171=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050701221504.GA26388@homer.coderock.org>
In-Reply-To: <20050701221504.GA26388@homer.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============48628916656229171==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 02/07/05 00:15 +0200, Domen Puncer wrote:
> On 01/07/05 11:19 -0700, Jesse Millan wrote:
> > -int kauditd_thread(void *dummy)
> > +void kauditd_thread(void *dummy)
> 
> This should warn too, as kthread_create() (kthread_run()) accepts
> int (*threadfn)(void *data)
> 
> I think kauditd_thread() should be fixed here to return something...
> "The return value should be zero or a negative error number:
>  it will be passed to kthread_stop()."

But it doesn't return at all (d'oh, should have seen this before).
Still... there's a warning if it returns void, right?


	Domen

--===============48628916656229171==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48628916656229171==--
