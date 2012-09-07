From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Fri, 07 Sep 2012 15:24:45 +0000
Subject: [PATCH 7/10] drivers/media/tuners/tda18271-common.c: removes unnecessary semicolon
Message-Id: <1347031488-26598-7-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, Julia.Lawall@lip6.fr, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

removes unnecessary semicolon

Found by Coccinelle: http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/media/tuners/tda18271-common.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff -u -p a/drivers/media/tuners/tda18271-common.c b/drivers/media/tuners/tda18271-common.c
--- a/drivers/media/tuners/tda18271-common.c
+++ b/drivers/media/tuners/tda18271-common.c
@@ -275,7 +275,7 @@ int tda18271_init_regs(struct dvb_fronte
 	case TDA18271HDC2:
 		regs[R_ID]   = 0x84;
 		break;
-	};
+	}
 
 	regs[R_TM]   = 0x08;
 	regs[R_PL]   = 0x80;
@@ -300,7 +300,7 @@ int tda18271_init_regs(struct dvb_fronte
 	case TDA18271HDC2:
 		regs[R_EB1]  = 0xfc;
 		break;
-	};
+	}
 
 	regs[R_EB2]  = 0x01;
 	regs[R_EB3]  = 0x84;
@@ -320,7 +320,7 @@ int tda18271_init_regs(struct dvb_fronte
 	case TDA18271HDC2:
 		regs[R_EB12] = 0x33;
 		break;
-	};
+	}
 
 	regs[R_EB13] = 0xc1;
 	regs[R_EB14] = 0x00;
@@ -335,7 +335,7 @@ int tda18271_init_regs(struct dvb_fronte
 	case TDA18271HDC2:
 		regs[R_EB18] = 0x8c;
 		break;
-	};
+	}
 
 	regs[R_EB19] = 0x00;
 	regs[R_EB20] = 0x20;
@@ -347,7 +347,7 @@ int tda18271_init_regs(struct dvb_fronte
 	case TDA18271HDC2:
 		regs[R_EB21] = 0xb3;
 		break;
-	};
+	}
 
 	regs[R_EB22] = 0x48;
 	regs[R_EB23] = 0xb0;

