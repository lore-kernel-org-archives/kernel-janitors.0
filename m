From: Andi Shyti <andi.shyti@gmail.com>
Date: Sat, 27 Jul 2013 19:20:45 +0000
Subject: Re: [PATCH 1/2] staging: lustre: Fix non-ANSI sparse warnings
Message-Id: <20130727192045.GA29842@jack.whiskey>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1374950412-15973-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1374950412-15973-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> This patch fixes a lot of non-ANSI sparse warnings.

would be better if you sepcify which non-ANSI sparse warnings.

In this patch you are doing only one type of change that is to
add a void parameter to functions which don't get one.

Andi

> Signed-off-by: Emil Goode <emilgoode@gmail.com>
