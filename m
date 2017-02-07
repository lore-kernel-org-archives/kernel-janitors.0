From: Jens Axboe <axboe@fb.com>
Date: Tue, 07 Feb 2017 23:17:44 +0000
Subject: Re: [PATCH] gdrom: Add missing error code
Message-Id: <0c1d5da3-ce57-8687-f0f2-8ae12b40ccd8@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170206220013.3851-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170206220013.3851-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, hch@lst.de
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 02/06/2017 03:00 PM, Christophe JAILLET wrote:
> In case of error, 'err' is known to be 0 here, because of the previous
> test. Set it to a -ENOMEM instead.

Added for 4.11, thanks.

-- 
Jens Axboe

