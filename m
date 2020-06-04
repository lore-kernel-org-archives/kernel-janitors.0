From: Joe Perches <joe@perches.com>
Date: Thu, 04 Jun 2020 09:17:35 +0000
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()' which is unused and broken
Message-Id: <2aa49a543e6f48a6f428a37b63a06f9149870225.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
 <87h7vvb1s3.fsf@belgarion.home>
 <a2e34c9a-676f-d83f-f395-7428af038c16@wanadoo.fr>
 <20200601183102.GS30374@kadam>
 <CACRpkdasbS-4_ZwC-Ucm8tkSUW5tAQdUrXjxHXQ3J0goVYfgHw@mail.gmail.com>
 <20200604083120.GF22511@kadam>
In-Reply-To: <20200604083120.GF22511@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Thu, 2020-06-04 at 11:31 +0300, Dan Carpenter wrote:
> On Thu, Jun 04, 2020 at 12:08:49AM +0200, Linus Walleij wrote:
[]
> > Fixes means it fixes something that was wrong in that commit.
> > That's all. Whether syntactic or semantic or regression or
> > serious or not does not matter. It is also not compulsory to
> > add it is just helpful.
> 
> Fixes tag should be compulsory for actual bug fixes.  We had a the
> Bad Binder exploit last year because commit f5cb779ba163
> ("ANDROID: binder: remove waitqueue when thread exits.") had no Fixes
> tag and wasn't backported to Android kernels.

Fixes tags IMO should be exclusively for actual bug fixes
and should be mandatory.

Perhaps:
---
 Documentation/process/submitting-patches.rst | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 1699b7f8e63a..285a84ae79de 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -636,12 +636,14 @@ idea was not posted in a public forum. That said, if we diligently credit our
 idea reporters, they will, hopefully, be inspired to help us again in the
 future.
 
-A Fixes: tag indicates that the patch fixes an issue in a previous commit. It
-is used to make it easy to determine where a bug originated, which can help
-review a bug fix. This tag also assists the stable kernel team in determining
-which stable kernel versions should receive your fix. This is the preferred
-method for indicating a bug fixed by the patch. See :ref:`describe_changes`
-for more details.
+A Fixes: tag indicates that the patch fixes a "bug". i.e.: a logic defect or
+regression in a previous commit.  A Fixes: tag should not be used to indicate
+that a previous commit had some trivial defect in spelling in the commit log or
+some whitespace defect.  The Fixes: tag is used to make it easy to determine
+where a bug originated, which can help review a bug fix. The Fixes: tag also
+assists the stable kernel team in determining which stable kernel versions
+should receive your fix. This is the preferred method for indicating a bug is
+fixed by the patch.  See :ref:`describe_changes` for more details.
 
 .. _the_canonical_patch_format:
 
