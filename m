From: Daniel Smertnig <daniel.smertnig@gmail.com>
Date: Wed, 22 Jun 2005 17:02:17 +0000
Subject: [KJ] Re: [PATCH] isdn: check copy_to/from_user() return values
Message-Id: <18dd01ff0506221002764681b9@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 6/18/05, Daniel Smertnig <daniel.smertnig@gmail.com> wrote:
> Fix a few instances in drivers/isdn/ where the copy_(to|from)_user
> return value is not checked for.

Whoops, sorry, this seems to be in the kj-patchset already, didn't notice it

daniel

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
