json.html (render "components/card", card: @annotation, delete_url: project_recipe_state_annotation_path(owner_name: @owner.name, project_id: @project.name, state_id: @recipe_card.id, id: @annotation.id), edit_url: edit_project_recipe_state_annotation_path(owner_name: @owner.name, project_id: @project.name, state_id: @recipe_card.id, id: @annotation.id))