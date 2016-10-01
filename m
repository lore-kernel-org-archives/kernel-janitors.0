From: Joe Perches <joe@perches.com>
Date: Sat, 01 Oct 2016 20:19:54 +0000
Subject: Re: [PATCH 00/15] improve function-level documentation
Message-Id: <1475353194.1996.3.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, linux-metag@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, drbd-dev@lists.linbit.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Sat, 2016-10-01 at 21:46 +0200, Julia Lawall wrote:
> These patches fix cases where the documentation above a function definition
> is not consistent with the function header.  Issues are detected using the
> semantic patch below (http://coccinelle.lip6.fr/).  Basically, the semantic
> patch parses a file to find comments, then matches each function header,
> and checks that the name and parameter list in the function header are
> compatible with the comment that preceeds it most closely.

Hi Julia.

Would it be possible for a semantic patch to scan for
function definitions where the types do not have
identifiers and update the definitions to match the
declarations?

For instance, given:

<some.h>
int foo(int);

<some.c>
int foo(int bar)
{
	return baz;
}

Could coccinelle output:

diff a/some.h b/some.h
[]
-int foo(int);
+int foo(int bar);
