From: "anubhav rakshit" <anubhavrocks@gmail.com>
Date: Fri, 25 Apr 2008 19:24:05 +0000
Subject: Re: [PATCH] The function register_chrdev_region() for count=0 returns a false success.This patch pre
Message-Id: <623132dc0804251212l6c669120l5f056f02947a60bd@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080425182734.GJ14990@parisc-linux.org>
In-Reply-To: <20080425182734.GJ14990@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

<--snip-->
>  A space between 'if' and '(', please.  scripts/checkpatch.pl can warn
>  you about this kind of thing.
<--snip-->
Resending with corrections

Signed-off-by: Anubhav Rakshit <anubhavrocks@gmail.com>
---
 fs/char_dev.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/fs/char_dev.c b/fs/char_dev.c
index 038674a..e042aa7 100644
--- a/fs/char_dev.c
+++ b/fs/char_dev.c
@@ -200,6 +200,9 @@ int register_chrdev_region(dev_t from, unsigned
count, const char *name)
 	dev_t to = from + count;
 	dev_t n, next;

+	if (unlikely(count = 0))
+		return -EINVAL;
+
 	for (n = from; n < to; n = next) {
 		next = MKDEV(MAJOR(n)+1, 0);
 		if (next > to)
--
