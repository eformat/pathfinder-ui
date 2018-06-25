package com.redhat.gps.pathfinder.domain;

/*-
 * #%L
 * Pathfinder
 * $Id:$
 * $HeadURL:$
 * %%
 * Copyright (C) 2018 RedHat
 * %%
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * #L%
 */

//import lombok.Data;
//import org.springframework.data.annotation.Id;
//import org.springframework.data.mongodb.core.mapping.Document;
//import org.springframework.data.mongodb.core.mapping.Field;

//import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

/**
 * A Assessments.
 */
//@Document(collection = "assessments")
//@Data
public class Assessments implements Serializable {

    private static final long serialVersionUID = 1L;

//    @Id
    private String id;

//    @NotNull
//    @Field("results")
    private HashMap<String, String> results;


//    @Field("dependencies")
    private List<String> deps = new ArrayList<String>();

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Assessments that = (Assessments) o;
        return Objects.equals(id, that.id) &&
            Objects.equals(results, that.results) &&
            Objects.equals(deps, that.deps) &&
            Objects.equals(datetime, that.datetime);
    }

    @Override
    public int hashCode() {

        return Objects.hash(super.hashCode(), id, results, deps, datetime);
    }

    public String getDatetime() {

        return datetime;
    }

    public void setDatetime(String datatime) {
        this.datetime = datatime;
    }

//    @Field("AssessmentDateTime")
    private String datetime;

    // jhipster-needle-entity-add-field - JHipster will add fields here, do not remove
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Assessments{" +
            "id='" + id + '\'' +
            ", results=" + results +
            ", deps=" + deps +
            ", datetime='" + datetime + '\'' +
            '}';
    }

    public HashMap<String, String> getResults() {
        return results;
    }

    public Assessments results(HashMap<String, String> results) {
        this.results = results;
        return this;
    }

    public void setResults(HashMap<String, String> results) {
        this.results = results;
    }

    public List<String> getDeps() {
        return deps;
    }

    public void setDeps(List<String> deps) {
        this.deps = deps;
    }

    // jhipster-needle-entity-add-getters-setters - JHipster will add getters and setters here, do not remove

}
