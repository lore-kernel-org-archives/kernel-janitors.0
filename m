From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 20 Apr 2005 18:38:43 +0000
Subject: Re: [KJ] Re: Audit return codes (Question about getting started)
Message-Id: <20050420113843.3a8f36eb.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60837370460642548=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42669D23.9010501@gmail.com>
In-Reply-To: <42669D23.9010501@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============60837370460642548==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 20 Apr 2005 11:19:15 -0700 Jesse Millan wrote:

| I just want to make sure that I understand the process correctly:
| 
| For example, take kalloc(). If I find instances that that the return

take kmalloc() or kcalloc()  [there is no kalloc()]

| value is not checked (and I have) i.e. they call kalloc() and
| automatically assume success and dereference the allocated memory
| without checking for NULL. I would insert to proper error checking,
| create the patch and mail the patch to kernel-janitors@lists.osdl.org?

and usually cc: the maintainer...

| Is this the process?

That's the process, but there is a caveat.  (There are
probably caveats for everything...)

During kernel/system init, if an allocation fails,
it's useless to report an error and try to keep going,
so just let it fail by referencing an invalid memory
address (like near NULL).

If you find places after system init has completed
that do not check for allocation failures, then they
should be fixed (in general); i.e., send patches and we
will evaluate them.


| Jesse Millan wrote:
| > Is anyone already working on this?
| > 
| > Its the first item in the TODO list:
| > 
| > http://janitor.kernelnewbies.org/TODO
| > 
| > I am looking for an easy project. I am a total newbie, but I want to get
| > involved with Kernel Janitors.

---
~Randy

--===============60837370460642548==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60837370460642548==--
