From: Benoit Taine <benoit.taine@lip6.fr>
Date: Wed, 28 May 2014 15:14:05 +0000
Subject: [PATCH 0/2] Use resource_size instead of computation
Message-Id: <1401290047-30005-1-git-send-email-benoit.taine@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: benoit.taine@lip6.fr, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, alsa-devel@alsa-project.org

These patches enhance kernel style usage, and make use of the
resource_size() function instead of explicit computation.

The semantic patch at scripts/coccinelle/api/resource_size.cocci was
used to detect and edit this situation.
