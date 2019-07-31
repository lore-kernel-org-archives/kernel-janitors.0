From: Joonwon Kang <kjw1627@gmail.com>
Date: Wed, 31 Jul 2019 18:00:27 +0000
Subject: [PATCH 0/2] fix is_pure_ops_struct()
Message-Id: <cover.1564595346.git.kjw1627@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: keescook@chromium.org
Cc: re.emese@gmail.com, kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, jinb.park7@gmail.com

Hello,

This series fixes unreachable code bug and removes dead code in
is_pure_ops_struct().

Thanks.

Joonwon Kang (2):
  randstruct: fix a bug in is_pure_ops_struct()
  randstruct: remove dead code in is_pure_ops_struct()

 scripts/gcc-plugins/randomize_layout_plugin.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

-- 
2.17.1
