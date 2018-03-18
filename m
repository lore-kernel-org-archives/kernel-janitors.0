From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 18 Mar 2018 22:48:08 +0000
Subject: [PATCH 0/2] drm/sun4i: Fix some error handling paths in 'sun4i_hdmi_bind()'
Message-Id: <cover.1521413031.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maxime.ripard@free-electrons.com, airlied@linux.ie, wens@csie.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

I've splitted these fixes into 2 patches becasue they do not fixe the same
commit.

Christophe JAILLET (2):
  drm/sun4i: hdmi: Fix an error handling path in 'sun4i_hdmi_bind()'
  drm/sun4i: hdmi: Fix another error handling path in
    'sun4i_hdmi_bind()'

 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.14.1

