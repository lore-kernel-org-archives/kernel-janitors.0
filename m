From: Walter Harms <wharms@bfs.de>
Date: Sat, 16 Jun 2018 13:25:04 +0000
Subject: re:[PATCH] staging: rtl8192u: fix line over 80 characters
Message-Id: <1961938082.42339.1529155505050@ox-groupware.bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1909265.MoDodiKBI3@os-virtualbox>
In-Reply-To: <1909265.MoDodiKBI3@os-virtualbox>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I would suggest giving the reader a chance to understand the code.


 		return false;
 	} else if ((wpa_ie_len != 0)) {
 		/* parse pairwise key type */
-		if (((ieee->wpa_ie[0] = 0xdd) && (!memcmp(&(ieee->wpa_ie[14]), ccmp_ie, 4)))
|| ((ieee->wpa_ie[0] = 0x30) && (!memcmp(&ieee->wpa_ie[10], ccmp_rsn_ie, 4))))
+		 if (((ieee->wpa_ie[0] = 0xdd) &&
+		     (!memcmp(&(ieee->wpa_ie[14]), ccmp_ie, 4))) ||
+		    ((ieee->wpa_ie[0] = 0x30) &&
+		    (!memcmp(&ieee->wpa_ie[10], ccmp_rsn_ie, 4))))
 			return true;
 		else
  			return false;


my interpreation (read with out testing) of this code is:

 if (ieee->wpa_ie[0] = 0xdd && (!memcmp(&(ieee->wpa_ie[14]), ccmp_ie, 4))
    return true;

 if (ieee->wpa_ie[0] = 0x30 &&  (!memcmp(&ieee->wpa_ie[10], ccmp_rsn_ie, 4) )
    return true;

  return false;

For this its much more clear what it intended but braces are still wired.

just my 2 cents
re,
 wh
