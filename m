From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 03 Feb 2006 06:24:36 +0000
Subject: Re: [KJ] the process patches go through on their way to Linus' kernel
Message-Id: <20060203062436.GB21397@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25747559061724568=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <a01a16b50602022110r51c13a09s7a1fd854d46faa56@mail.gmail.com>
In-Reply-To: <a01a16b50602022110r51c13a09s7a1fd854d46faa56@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============25747559061724568==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 03.02.2006 [06:10:43 +0100], H?kon L?vdal wrote:
> Hi. I am trying to understand and get an overview of the
> process patches go through on their way to Linus' kernel.

<snip some beautiful ASCII art>

> How much of the kernel janitor work is passing through
> http://coderock.org/kj/, most, some, little?

Pretty much all of it does, or, at least, it used to. If a maintainer
picks up a patch and Alexey sees that it is no longer necessary for it
to be in his stack, he will drop it, I would expect. I think coderock,
though, is only for holding releases of the -KJ tree, so the conflict
between merged up patches and non-merged up patches should be less.

> For black box 1 I assume a set of janitors have commit access to
> http://coderock.org/kj/, and if the patch accepted (and not CC'ed to
> maintainer or someone else accepting/rejecting it), the patch ends
> up there.

That would be Alexey Dobriyan.

> Some older documents
> (http://www.advogato.org/proj/Linux%20Kernel%20Janitor/ and
> http://archive.linuxsymposium.org/ols2003/Proceedings/All-Reprints/Reprint-Melo-OLS2003.pdf)
> gives a list of names but I am not able to find any current list.
> 
> For black box 2 I am more unsure. How does patches go from
> http://coderock.org/kj/ to git://.../torvalds/linux-2.6.git?

Every so often (when Alexey or whomever is the current KJ maintainer has
time), a -kj kernel patch is released (the current rev can always be
found in the \topic at oftc:#kerneljanitor). The patches are sent to
appropriate maintainers and LKML, usually. If they are accepted by the
maintainers or Andrew, they get pulled and end up in -mm, from which
Linus takes patches regularly.

Hope that helps.

Thanks,
Nish

--===============25747559061724568==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25747559061724568==--
