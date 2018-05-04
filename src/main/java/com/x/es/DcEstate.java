package com.x.es;

import io.searchbox.annotations.JestId;
import org.elasticsearch.common.geo.GeoPoint;

public class DcEstate {
	@JestId
	private String estateId;
	private String estateName;
	private String estateAlias;
	private String estateAddress;
	private GeoPoint estateLocation;
	private String districtId;
	private String districtName;

	public String getEstateId() {
		return estateId;
	}

	public void setEstateId(String estateId) {
		this.estateId = estateId;
	}

	public String getEstateName() {
		return estateName;
	}

	public void setEstateName(String estateName) {
		this.estateName = estateName;
	}

	public String getEstateAlias() {
		return estateAlias;
	}

	public void setEstateAlias(String estateAlias) {
		this.estateAlias = estateAlias;
	}

	public String getEstateAddress() {
		return estateAddress;
	}

	public void setEstateAddress(String estateAddress) {
		this.estateAddress = estateAddress;
	}

	public GeoPoint getEstateLocation() {
		return estateLocation;
	}

	public void setEstateLocation(GeoPoint estateLocation) {
		this.estateLocation = estateLocation;
	}

	public String getDistrictId() {
		return districtId;
	}

	public void setDistrictId(String districtId) {
		this.districtId = districtId;
	}

	public String getDistrictName() {
		return districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
}
