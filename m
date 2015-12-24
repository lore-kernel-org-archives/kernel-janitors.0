From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 24 Dec 2015 12:34:20 +0000
Subject: [PATCH 1/3] Documentation-getdelays: Fix a check for container file usage in main()
Message-Id: <567BE64C.4090604@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <567BE5AA.6070607@users.sourceforge.net>
In-Reply-To: <567BE5AA.6070607@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 24 Dec 2015 11:00:54 +0100

The close() function could be called by the main() function even if
the passed variable "cfd" was assigned a negative value.

* Corresponding implementation details could be improved by adjustments
  for jump targets according to the Linux coding style convention.

* Fix the affected condition check.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 Documentation/accounting/getdelays.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/Documentation/accounting/getdelays.c b/Documentation/accounting/getdelays.c
index f405780..6656c0c 100644
--- a/Documentation/accounting/getdelays.c
+++ b/Documentation/accounting/getdelays.c
@@ -383,7 +383,7 @@ int main(int argc, char *argv[])
 	id = get_family_id(nl_sd);
 	if (!id) {
 		fprintf(stderr, "Error getting family id, errno %d\n", errno);
-		goto err;
+		goto close_socket;
 	}
 	PRINTF("family id %d\n", id);
 
@@ -394,13 +394,13 @@ int main(int argc, char *argv[])
 		PRINTF("Sent register cpumask, retval %d\n", rc);
 		if (rc < 0) {
 			fprintf(stderr, "error sending register cpumask\n");
-			goto err;
+			goto close_socket;
 		}
 	}
 
 	if (tid && containerset) {
 		fprintf(stderr, "Select either -t or -C, not both\n");
-		goto err;
+		goto close_socket;
 	}
 
 	/*
@@ -426,18 +426,18 @@ int main(int argc, char *argv[])
 		cfd = open(containerpath, O_RDONLY);
 		if (cfd < 0) {
 			perror("error opening container file");
-			goto err;
+			goto close_socket;
 		}
 		rc = send_cmd(nl_sd, id, mypid, CGROUPSTATS_CMD_GET,
 			      CGROUPSTATS_CMD_ATTR_FD, &cfd, sizeof(__u32));
 		if (rc < 0) {
 			perror("error sending cgroupstats command");
-			goto err;
+			goto close_container;
 		}
 	}
 	if (!maskset && !tid && !containerset) {
 		usage();
-		goto err;
+		goto check_container;
 	}
 
 	do {
@@ -536,11 +536,14 @@ done:
 		if (rc < 0)
 			err(rc, "error sending deregister cpumask\n");
 	}
-err:
+check_container:
+	if (cfd >= 0) {
+close_container:
+		close(cfd);
+	}
+close_socket:
 	close(nl_sd);
 	if (fd)
 		close(fd);
-	if (cfd)
-		close(cfd);
 	return 0;
 }
-- 
2.6.3

