From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 19 Oct 2017 13:36:46 +0000
Subject: Re: [PATCH 4/4] char/tpm: Less checks in tpm_ibmvtpm_probe() after error detection
Message-Id: <20171019133646.gu7qv2tywfk4tcxj@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d3516a2-a8e6-9e95-d438-f115fac84c7f@users.sourceforge.net>
 <09a2c3a1-1b10-507d-a866-258b570f6da1@users.sourceforge.net>
 <20171019135632.4af42743@kitsune.suse.cz>
In-Reply-To: <20171019135632.4af42743@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Kenneth Goldman <kgold@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nayna Jain <nayna@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, Peter =?iso-8859-1?Q?H=FCwe?= <PeterHuewe@gmx.de>, Stefan Berger <stefanb@linux.vnet.ibm.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, Oct 19, 2017 at 01:56:32PM +0200, Michal Such=E1nek wrote:
>=20
> I think a single cleanup section is better than many labels that just
> avoid a single null check.
>

I am not a big advocate of churn, but one err style error handling is
really bug prone.

I'm dealing with static analysis so most of the bugs I see are error
handling bugs.  That's because error handling is hard to test but easy
for static analysis.  One err style error handling is the worst because
you get things like:

fail:
	kfree(foo->bar);
	kfree(foo);

Oops, foo->bar is a NULL dereference.  And generally, it's a bad thing
to free things that haven't been allocated so, for example, I see
refcounting bugs in error handling paths as well where we decrement
something that wasn't incremented.  Freeing everything is more
complicated than just freeing one specific thing the way standard kernel
error handling works.

> As long as you can tell easily which resources were already allocated
> and need to be freed it is saner to keep only one cleanup section.
>=20

Sure, if the function is simple and short then the error handling is
normally simple and short.  This is true for any style of error
handling.

> If the code doing the allocation is changed in the future the single
> cleanup can stay whereas multiple labels have to be rewritten again.

No, they don't unless you choose bad label names.  Perhaps numbered
labels?  We don't get a lot of those in the kernel any more.  Label
name should be based on what the label does.  Often I see bad label
names like generic labels:

	foo =3D kmalloc();
	if (!foo)
		goto out;

What is out going to do?  Another common anti-pattern is come-from
labels:

	foo =3D kmalloc();
	if (!foo)
		goto kmalloc_failed;

Obviously, we can see from the if statement that the alloc failed and
you *just* know the next line is going to be is going to be:

	if (invalid)
		goto kmalloc_failed;

Which is wrong because kmalloc didn't fail...  But if the label name is
based on what it does then, when you add or a remove an allocation, you
just have to edit the one thing.  It's very simple:

+	foo =3D new_alloc();
+	if (!foo)
+		return -ENOMEM;
+
 	bar =3D old_alloc();
-	if (!bar)
-		return -ENOMEM;
+	if (!bar) {
+		ret -ENOMEM;
+		goto free_foo;

[ snip ]

 free_whatever:
 	free(whatever);
+free_foo:
+	free(foo);

 return ret;

>=20
> Also just changing this just for the sake of code style does not seem
> worth it whatever style you prefer.

True.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
