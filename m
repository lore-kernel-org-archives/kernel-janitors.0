From: Firo Yang <firogm@gmail.com>
Date: Thu, 23 Apr 2015 05:33:50 +0000
Subject: [PATCH 0/15]Remove unneeded casts of memory-alloc function return values
Message-Id: <1429767245-32453-1-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The memory-alloc() functions return a void pointer, so when 
assigning to a pointer type variable there is no need to cast 
the return value.

