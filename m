From: Jens Axboe <axboe@kernel.dk>
Date: Mon, 12 Oct 2020 14:24:42 +0000
Subject: Re: [PATCH][next] io_uring: Fix sizeof() mismatch
Message-Id: <871e585c-06ca-17cb-f082-fec576bb75e1@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201012140341.77412-1-colin.king@canonical.com>
In-Reply-To: <20201012140341.77412-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Pavel Begunkov <asml.silence@gmail.com>, linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/12/20 8:03 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> An incorrect sizeof() is being used, sizeof(file_data->table) is not
> correct, it should be sizeof(*file_data->table).

Thanks, should be a no-op, which is why KASAN didn't complain in my
testing. I'll queue this up, thanks.

-- 
Jens Axboe
