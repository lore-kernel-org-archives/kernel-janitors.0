From: Christoph Hellwig <hch@lst.de>
Date: Sun, 16 Dec 2018 16:26:38 +0000
Subject: Re: [PATCH][next] nvmet: fix comparison of a u16 with -1
Message-Id: <20181216162638.GB12651@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181214183121.17445-1-colin.king@canonical.com>
In-Reply-To: <20181214183121.17445-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Thanks, applied.

Maybe it might be worth adding a NVME_NO_ERR_LOC defintion to clean
this up a bit more.  Chaitanya, can you look into that?
