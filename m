From: Jiri Kosina <jikos@kernel.org>
Date: Tue, 17 Jul 2018 13:52:21 +0000
Subject: Re: [PATCH] HID: intel-ish-hid: remove redundant variable num_frags
Message-Id: <nycvar.YFH.7.76.1807171552150.997@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180702094028.15428-1-colin.king@canonical.com>
In-Reply-To: <20180702094028.15428-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2 Jul 2018, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable num_frags is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'num_frags' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

