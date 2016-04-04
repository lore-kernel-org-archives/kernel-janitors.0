From: Jiri Kosina <jikos@kernel.org>
Date: Mon, 04 Apr 2016 07:50:01 +0000
Subject: Re: [patch] HID: roccat: silence an uninitialized variable warning
Message-Id: <alpine.LNX.2.00.1604040949540.16158@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160402044432.GA11775@mwanda>
In-Reply-To: <20160402044432.GA11775@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stefan Achatz <erazor_de@users.sourceforge.net>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2 Apr 2016, Dan Carpenter wrote:

> My static checker complains because we use "dev_id" before we check for
> errors so it could be uninitialized.  Fix this by moving the error
> handling forward a couple lines.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

