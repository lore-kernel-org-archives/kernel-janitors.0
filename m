From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Fri, 08 Sep 2017 17:12:35 +0000
Subject: Re: [PATCH] signal: remove unused variable mask
Message-Id: <20170908171235.GA5426@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170908155639.4413-1-colin.king@canonical.com>
In-Reply-To: <20170908155639.4413-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Sep 08, 2017 at 04:56:39PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable mask was introduced by an earlier commit and does not seem
> to be used, so remove it.

Equivalent is already folded into the original commit in my tree; will
push out tonight
