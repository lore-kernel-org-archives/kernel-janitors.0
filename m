From: andre@finow14.de
Date: Thu, 30 Aug 2007 10:35:11 +0000
Subject: [KJ][patch 0/3] use abs() from kernel.h where appropriate
Message-Id: <20070830103511.GA14925@ahaupt-debian-vm.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

This small series of quite trivial patches converts a own definition
of the abs macro to the one from kernel.h and replaces some inline
calculations of abs with the macro.

--
