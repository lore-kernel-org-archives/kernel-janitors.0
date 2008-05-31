From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Sat, 31 May 2008 19:05:27 +0000
Subject: Re: [PATCH] ext3 : Remove redundant condition in
Message-Id: <20080531190527.GG28946@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30805311156q7488714ftf8b0b8b8cea85b76@mail.gmail.com>
In-Reply-To: <ea11fea30805311156q7488714ftf8b0b8b8cea85b76@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manish Katiyar <mkatiyar@gmail.com>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Jun 01, 2008 at 12:26:41AM +0530, Manish Katiyar wrote:
> For two unsigned values the check "block+count < block"  is always
> false. Thus the below patch removes that condition.

Really?  Always?

	unsigned block = 1;
	unsigned count = ~0U;

What will be the value and type of block + count?  What will be the
value of block + count < block?
