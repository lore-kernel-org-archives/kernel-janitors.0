From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Jan 2011 19:55:18 +0000
Subject: [PATCH 0/4] Add missing IS_ERR test
Message-Id: <1295898922-18822-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: open list <linux-kernel@vger.kernel.org>
Cc: kernel-janitors@vger.kernel.org

These patches perform various adjustments to error handling code related to
the possibility of an ERR_PTR value.

