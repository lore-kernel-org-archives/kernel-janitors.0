From: Jiri Kosina <jikos@kernel.org>
Date: Thu, 12 Nov 2020 15:27:11 +0000
Subject: Re: [PATCH][next] SFH: fix error return check for -ERESTARTSYS
Message-Id: <nycvar.YFH.7.76.2011121626590.6877@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201030143002.535531-1-colin.king@canonical.com>
In-Reply-To: <20201030143002.535531-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Nehal Shah <nehal-bakulchandra.shah@amd.com>, Sandeep Singh <sandeep.singh@amd.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 30 Oct 2020, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check for the error return code -ERESTARTSYS is dead code
> and never executed because a previous check for ret < 0 is catching this
> and returning -ETIMEDOUT instead.  Fix this by checking for -ERESTARTSYS
> before the more generic negative error code.
> 
> Addresses-Coverity: ("Logically dead code")
> Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs
