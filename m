From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 15 Jan 2006 22:24:05 +0000
Subject: Re: [KJ] Fw: Suggested janitor task - remove __init/__exit from
Message-Id: <20060115222405.GA19795@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65061290686673612=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060114193606.0a0a8162.rdunlap@xenotime.net>
In-Reply-To: <20060114193606.0a0a8162.rdunlap@xenotime.net>
To: kernel-janitors@vger.kernel.org

--===============65061290686673612==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 14, 2006 at 07:36:06PM -0800, Randy.Dunlap wrote:
> Alexey, comments/thoughts?

Thanks for ping. I saw it on l-k, I like it.

> Begin forwarded message:
>
> Date: Sun, 15 Jan 2006 13:11:35 +1100
> From: Keith Owens <kaos@ocs.com.au>
> To: linux-kernel@vger.kernel.org
> Subject: Suggested janitor task - remove __init/__exit from function prototypes
>
> Some function prototypes (in both .h and .c files) specify attributes
> like __init and __exit in the prototype.  gcc (at least at 3.3.3) uses
> the last such attribute that is actually specified, without issuing a
> warning.  So we can have :-
>
> * Prototype declarations that use one attribute and a function body
>   that uses another attribute.
>
> * Functions that from the .c code appear to be normal text but the .h
>   file is silently setting a special attribute.

Out of curiosity, can someone name an example?

> Both are potential sources of programmer confusion or bugs.  I suggest
> a janitor task to find all function prototypes that use __init, __exit,
> __devinit, __devexit, __cpuinit or __cpuexit and remove the attribute
> from the prototype.  If the function body does not already specify a
> suitable attribute then add the attribute to the function body.
>
> The same task could be done for extern data declarations.

Keith, can you clarify?

> Once that is done, remove #include <linux/init.h> from all .h files.

Worth it just because of this sentence. I lost a file in a tree which
took 3 (three) seconds to just preprocess and 10 (ten) seconds overall. No,
it's not advansys.c.

> Only .[cS] files should specify which section the data and text are
> stored in, .h files should only define the C language information.


--===============65061290686673612==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65061290686673612==--
