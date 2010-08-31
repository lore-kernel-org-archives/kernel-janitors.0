From: Julia Lawall <julia@diku.dk>
Date: Tue, 31 Aug 2010 15:48:54 +0000
Subject: [PATCH 0/4] Add of_node_put to avoid memory leak
Message-Id: <1283269738-14612-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

These patches introduce calls to of_node_put after various functions that
call of_node_get.

