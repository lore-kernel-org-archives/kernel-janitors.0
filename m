From: Paul Mackerras <paulus@samba.org>
Date: Fri, 27 Jul 2007 23:48:58 +0000
Subject: Re: [PATCH 12/68] 0 -> NULL, for arch/powerpc
Message-Id: <18090.33898.360087.492895@cargo.ozlabs.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270945.LAA17267@ifs.emn.fr>
In-Reply-To: <200707270945.LAA17267@ifs.emn.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: linuxppc-dev@ozlabs.org, akpm@linux-foundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Yoann Padioleau writes:

> When comparing a pointer, it's clearer to compare it to NULL than to 0.

As other people have said, if you're going to spend time on this,
testing (!buf) is more idiomatic in the kernel than (buf = NULL).

Paul.
