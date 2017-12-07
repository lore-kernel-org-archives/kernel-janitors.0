From: Jiri Kosina <jikos@kernel.org>
Date: Thu, 07 Dec 2017 10:01:51 +0000
Subject: Re: [PATCH][next] HID: quirks: make array hid_quirks static
Message-Id: <nycvar.YFH.7.76.1712071101370.3572@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171204111910.2840-1-colin.king@canonical.com>
In-Reply-To: <20171204111910.2840-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 4 Dec 2017, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Array hid_quirks is local to the source and does not need to be in
> global scope, so make it static.
> 
> Cleans up sparse warning:
> drivers/hid/hid-quirks.c:29:28: warning: symbol 'hid_quirks' was not
> declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to for-4.16/hid-quirks-cleanup/_base. Thanks,

-- 
Jiri Kosina
SUSE Labs

