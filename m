From: "Stoyan Gaydarov" <stoyboyker@gmail.com>
Date: Mon, 07 Jul 2008 03:52:50 +0000
Subject: round_jiffies() question
Message-Id: <6d291e080807062052n16073eb4t53c88f09df430c6e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I was just wondering when should round_jiffies() be used instead of
assigning the timer expiration with a specific jiffies value? Is the
round_jiffies() function call beneficial everywhere or just some
places?

-Stoyan G
