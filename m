From: Joe Perches <joe@perches.com>
Date: Tue, 26 Dec 2017 18:04:31 +0000
Subject: Re: [PATCH 0/1] Input: inline macros for MODULE_LICENSE, etc
Message-Id: <1514311471.3468.8.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514307905-3486-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514307905-3486-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-input@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Tue, 2017-12-26 at 18:05 +0100, Julia Lawall wrote:
> Inline macro for MODULE_LICENSE to make the license information easy to
> find, eg with grep.  Inline the other module-related macros at the same
> time.

Perhaps it'd be better to not make this
dependent on a MODULE_LICENSE use, but allow
any #define foo/#define MODULE_<FOO> foo
where foo is used once to be converted.

