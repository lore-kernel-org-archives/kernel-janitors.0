From: T Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 18:25:00 +0000
Subject: [PATCH 00/21] Staging: cleaned up makefiles cflag lines
Message-Id: <AANLkTikqf4rn6BP2gyQAuQrvt7EdFY8yfa+o8nfR9xWE@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I changed every makefile in the staging directory to use the proper
ccflags-y option instead of EXTRA_CFLAGS. It builds also :) .

Thanks,
Tracey Dent
