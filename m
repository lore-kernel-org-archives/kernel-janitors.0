From: Jens Axboe <axboe@kernel.dk>
Date: Thu, 15 Oct 2020 13:12:16 +0000
Subject: Re: [PATCH][next] io_uring: fix flags check for the REQ_F_WORK_INITIALIZED setting
Message-Id: <fc06e668-e358-9009-441e-d70b64285536@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201015115550.485235-1-colin.king@canonical.com>
In-Reply-To: <20201015115550.485235-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Pavel Begunkov <asml.silence@gmail.com>, linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/15/20 5:55 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check for REQ_F_WORK_INITIALIZED is always true because
> the | operator is being used. I believe this check should be checking
> if the bit is set using the & operator.

It should - I folded in the incremental from Pavel. This just meant that
we took the slow and safe path, but it obviously should be an AND here.

-- 
Jens Axboe
