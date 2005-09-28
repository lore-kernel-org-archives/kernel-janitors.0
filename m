From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 28 Sep 2005 17:56:14 +0000
Subject: Re: [KJ] Need to get some very basic things sorted out
Message-Id: <20050928175614.GA23122@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51829210429604622=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <433AB34E.90509@users.sourceforge.net>
In-Reply-To: <433AB34E.90509@users.sourceforge.net>
To: kernel-janitors@vger.kernel.org

--===============51829210429604622==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 28, 2005 at 05:14:22PM +0200, Dinolinux wrote:
> The thing is that I need help to get started. I'm in the process of
> learning C and I need to know how the kernel patching and distribution
> works.
> 
> 1 - I've looked into the kernel-janitor TODO list and I don't exactly
> understand lines like this:
> /Audit return codes (and handle failure correctly) for: /(What does
> this mean???)/

Consider example:

	buf = kmalloc(256, GFP_KERNEL);
	buf[0] = 'L';

See the prolem? kmalloc() can return NULL, which means "Not enough
memory". This buggy code doesn't check for NULL.

	buf = kmalloc(256, GFP_KERNEL);
	if (!buf)
		return -ENOMEM;
	buf[0] = 'L';

This sane code checks return value of kmalloc() and propagate proper
error. Note, note, note: undoing all previous allocations if one fails
is mandatory. See code around existing kmalloc()s to see how it's
usually done.

> - request_region() /(This one was tricky)/
> /Where do I have to look for the code?

grep for request_region. -C option of grep is very handy in such cases.

> Do I have to go to the _entire_ kernel tree?

It would be nice if each and every request_region() call is checked for
return value. Much patience is required for this.

> 2 - How do I start writing patches?

less Documentation/SubmittingPatches	(section 1 and the rest of
course)

> This doesn't tell me much:
> /Before attacking any of these, we suggest sending a few patches in
> advance to see if you are doing something wrong, or if someone else
> is already doing same work.
> Read related threads in the mailing list archive.
> /Which patches? Where do I find a TODO list of patches that need to be
> done?

You're reading one of them -- kernel-janitors TODO list. Things to be
done.


--===============51829210429604622==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51829210429604622==--
