From: David Howells <dhowells@redhat.com>
Date: Fri, 27 Jul 2007 10:14:57 +0000
Subject: Re: [PATCH 06/68] 0 -> NULL, for arch/frv
Message-Id: <22618.1185531297@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270944.LAA17167@ifs.emn.fr>
In-Reply-To: <200707270944.LAA17167@ifs.emn.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

Yoann Padioleau <padator@wanadoo.fr> wrote:

> When comparing a pointer, it's clearer to compare it to NULL than to 0.

Can you make them of style:

	if (!x)

instead?

Thanks,
David
