From: Vivek Subbarao <vskerneldevel@gmail.com>
Date: Sun, 14 Jul 2013 17:42:58 +0000
Subject: request_region return value check
Message-Id: <20130714173056.GA50500@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There are many places where the return value from request_region is not
checked for null value. This is required right ? I am just checking
before I can send patched fixing them
