From: Jiri Kosina <jikos@kernel.org>
Date: Tue, 15 Nov 2016 11:13:32 +0000
Subject: Re: [patch] HID: wacom: Don't clear bits unintentionally
Message-Id: <alpine.LNX.2.00.1611151213200.29400@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161110192539.GA32533@mwanda>
In-Reply-To: <20161110192539.GA32533@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 10 Nov 2016, Dan Carpenter wrote:

> This is trying to clear the lower 32 bits but the type is wrong so it
> clears everything.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to for-4.10/wacom/mobile-studio-pro. Thanks,

-- 
Jiri Kosina
SUSE Labs

