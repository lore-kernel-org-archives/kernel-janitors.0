From: David Miller <davem@davemloft.net>
Date: Tue, 13 Jul 2010 03:34:31 +0000
Subject: Re: [patch] 9p: strlen() doesn't count the terminator
Message-Id: <20100712.203431.216748245.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100710095154.GU19184@bicker>
	<20100712130458.bb8ae751.akpm@linux-foundation.org>
In-Reply-To: <20100712130458.bb8ae751.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org
Cc: error27@gmail.com, ericvh@gmail.com, adkulkar@umail.iu.edu, jvrao@us.ibm.com, linux-kernel@vger.kernel.org, tilman@code-monkey.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 12 Jul 2010 13:04:58 -0700

> This bug doesn't strike me as serious enough to warrant backporting the fix
> into -stable.  What was your thinking there?

Meanwhile I'll queue this up to net-next-2.6, thanks.
