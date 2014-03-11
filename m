From: Tejun Heo <tj@kernel.org>
Date: Tue, 11 Mar 2014 12:32:02 +0000
Subject: Re: [PATCH] pata_legacy: Remove dead code
Message-Id: <20140311123202.GC11477@htj.dyndns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <531e3c9a.085e0e0a.4316.ffffe91d@mx.google.com>
In-Reply-To: <531e3c9a.085e0e0a.4316.ffffe91d@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Silvan Jegen <s.jegen@gmail.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Mar 10, 2014 at 10:33:50PM +0100, Silvan Jegen wrote:
> The current flow of control prevents this function from being
> called. Let's remove the call.
> 
> Signed-off-by: Silvan Jegen <s.jegen@gmail.com>

Applied to libata/for-3.15.

Thanks.

-- 
tejun
