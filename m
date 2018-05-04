From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 04 May 2018 15:15:40 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dp: silence a static checker warning
Message-Id: <152544694068.11790.8689537864226551511@mail.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180503105306.GA5315@mwanda> <20180503164000.GJ2054@intel.com>
In-Reply-To: <20180503164000.GJ2054@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org

Quoting Rodrigo Vivi (2018-05-03 17:40:00)
> On Thu, May 03, 2018 at 01:53:22PM +0300, Dan Carpenter wrote:
> > Smatch warns that "n_entries" isn't always set.  It would trigger a
> > some WARN_ON()s on that path so presumably it can't happen but it's
> > simple enough to initialize it to zero just to silence the warning.
> 
> I usually would just ask if it would be possible to dispositioning
> as false positive or intentional on the tool, but it looks better
> indeed...

It doesn't appear to be a false positive.

intel_ddi_dp_voltage_max
 -> icl_get_combo_buf_trans()
 	default:
		MISSING_CASE();
		return NULL; /* *n_entries unset */

With

@@ -888,6 +888,7 @@ icl_get_combo_buf_trans(struct drm_i915_private *dev_priv, enum port port,
                        *n_entries = ARRAY_SIZE(icl_combo_phy_ddi_translations_edp_1_05V);
                        return icl_combo_phy_ddi_translations_edp_1_05V;
                default:
+                       *n_entries = 0;
                        MISSING_CASE(voltage);
                        return NULL;
                }
@@ -903,6 +904,7 @@ icl_get_combo_buf_trans(struct drm_i915_private *dev_priv, enum port port,
                        *n_entries = ARRAY_SIZE(icl_combo_phy_ddi_translations_dp_hdmi_1_05V);
                        return icl_combo_phy_ddi_translations_dp_hdmi_1_05V;
                default:
+                       *n_entries = 0;
                        MISSING_CASE(voltage);
                        return NULL;
                }

smatch is reassured that all paths then initialise n_entries.
-Chris
