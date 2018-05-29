From: Tejun Heo <tj@kernel.org>
Date: Tue, 29 May 2018 13:50:50 +0000
Subject: Re: [PATCH] libata: zpodd: small read overflow in eject_tray()
Message-Id: <20180529135050.GG1351649@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180529091320.axeryttqycdexzm5@kili.mountain>
In-Reply-To: <20180529091320.axeryttqycdexzm5@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, May 29, 2018 at 12:13:24PM +0300, Dan Carpenter wrote:
> We read from the cdb[] buffer in ata_exec_internal_sg().  It has to be
> ATAPI_CDB_LEN (16) bytes long, but this buffer is only 12 bytes.
> 
> Fixes: 213342053db5 ("libata: handle power transition of ODD")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to libata/for-4.17-fixes w/ stable cc'd.

Thanks.

-- 
tejun
