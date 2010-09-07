From: Christoph Lameter <cl@linux.com>
Date: Tue, 07 Sep 2010 01:59:02 +0000
Subject: Re: [PATCH 13/14] mm: mempolicy: Check return code of check_range
Message-Id: <alpine.DEB.2.00.1009062058270.1485@router.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711588-7628-1-git-send-email-segooon@gmail.com> <20100906093610.C8B5.A69D9226@jp.fujitsu.com>
In-Reply-To: <20100906093610.C8B5.A69D9226@jp.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Cc: Kulikov Vasiliy <segooon@gmail.com>, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Lee Schermerhorn <lee.schermerhorn@hp.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org

On Mon, 6 Sep 2010, KOSAKI Motohiro wrote:

> I think both case is not happen in real. Am I overlooking anything?

Its good to check the return code regardless. There is a lot of tinkering
going on with that code.

