From: randy_dunlap <rdunlap@xenotime.net>
Date: Fri, 01 Jul 2005 22:42:13 +0000
Subject: Re: [KJ] Re: GCC4 warning: no return statement in function
Message-Id: <20050701154213.60590dd8.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68686894471251914=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050701221504.GA26388@homer.coderock.org>
In-Reply-To: <20050701221504.GA26388@homer.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============68686894471251914==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 2 Jul 2005 00:22:51 +0200 Domen Puncer wrote:

| On 02/07/05 00:15 +0200, Domen Puncer wrote:
| > On 01/07/05 11:19 -0700, Jesse Millan wrote:
| > > -int kauditd_thread(void *dummy)
| > > +void kauditd_thread(void *dummy)
| > 
| > This should warn too, as kthread_create() (kthread_run()) accepts
| > int (*threadfn)(void *data)
| > 
| > I think kauditd_thread() should be fixed here to return something...
| > "The return value should be zero or a negative error number:
| >  it will be passed to kthread_stop()."
| 
| But it doesn't return at all (d'oh, should have seen this before).
| Still... there's a warning if it returns void, right?

so it needs 
  __attribute__((noreturn))
added to the function?
(or ATTRIB_NORET)

---
~Randy

--===============68686894471251914==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68686894471251914==--
