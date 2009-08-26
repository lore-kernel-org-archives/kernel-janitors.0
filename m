From: Stoyan Gaydarov <sgayda2@uiuc.edu>
Date: Wed, 26 Aug 2009 22:18:28 +0000
Subject: memcpy
Message-Id: <4A95B4B4.3020408@uiuc.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I wanted to know what memcpy returned as a result, and if it 
needs/should be checked. There are several places in the kernel where i 
noticed it being used but i also saw a warning about the result not 
being used, so i wanted to know a little more about it.

-Stoyan
